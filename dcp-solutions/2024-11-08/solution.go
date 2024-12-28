```go
package main

import (
    "crypto/md5"
    "encoding/hex"
    "fmt"
    "io/ioutil"
    "math/big"
)

type FileHash struct {
    file  string
    hash  []byte
}

func calculateFileHash(file string) (FileHash, error) {
    data, err := ioutil.ReadFile(file)
    if err != nil {
        return FileHash{}, err
    }

    md5Hash := md5.New()
    md5Hash.Write(data)
    fileHash := hex.EncodeToString(md5Hash.Sum(nil))

    return FileHash{file: file, hash: []byte(fileHash)}, nil
}

func syncFiles(localDir string, remoteDir string) error {
    localFiles, err := getLocalFiles(localDir)
    if err != nil {
        return err
    }

    for _, localFile := range localFiles {
        remoteFile := remoteDir + "/" + localFile.Name()
        localHash, err := calculateFileHash(localFile.Path)
        if err != nil {
            continue
        }
        remoteHash, err := calculateFileHash(remoteFile)
        if err != nil {
            return err
        }

        if !localHash.hash_equal(remoteHash.hash) {
            // If hashes are different, download and upload file
            fmt.Printf("Downloading %s from local to remote\n", localFile.Name())
            downloadRemote(localDir, remoteFile)

            // Upload file back to remote
            fmt.Printf("Uploading %s from local to remote\n", localFile.Name())
            uploadLocal(remoteDir, localFile.Path)
        } else {
            // If hashes are same, just update last modified time
            if !localHash.file_equal(remoteFile) {
                fmt.Printf("Updating %s with newer version\n", remoteFile)
                localFile.LastModified = remoteFile.LastModified
            }
        }
    }

    return nil
}

func getLocalFiles(dir string) ([]fileInfo, error) {
    files := make([]fileInfo, 0)
    err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
        if err != nil {
            return err
        }
        files = append(files, fileInfo{Path: path, Name: info.Name(), LastModified: info.ModTime()})
        return nil
    })
    return files, err
}

type fileInfo struct {
    Path string
    Name string
    LastModified time.Time
}

func downloadRemote(localDir string, remoteFile string) error {
    // Assume we have a function to download from remote file system
    return nil
}

func uploadLocal(remoteDir string, localFile string) error {
    // Assume we have a function to upload to remote file system
    return nil
}

type fileInfo struct {
    Path string
    Name string
    LastModified time.Time
}

func (f FileHash) hash_equal(other Hash) bool {
    return hex.EncodeToString(f.hash) == hex.EncodeToString(other)
}

func (f FileHash) file_equal(other string) bool {
    localFile, err := calculateFileHash(localPath + f.file)
    if err != nil {
        return false
    }
    return localFile.hash_equal(Hash{file: other})
}
```

Note that the above solution assumes you have functions to download and upload files from/ to a remote file system (this is not implemented here as it depends on your network setup). Also, `localPath` should be defined elsewhere in the code.