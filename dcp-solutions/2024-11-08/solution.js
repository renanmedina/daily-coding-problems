```javascript
class FileSync {
  constructor(localFiles, remoteFiles) {
    this.localFiles = localFiles;
    this.remoteFiles = remoteFiles;
    this.difference = {};
  }

  // This method sends a delta of the local files to the remote side.
  syncDelta() {
    for (let file in this.localFiles) {
      if (!this.remoteFiles[file] || this.localFiles[file] !== this.remoteFiles[file]) {
        this.difference[file] = { from: 'local', data: this.localFiles[file], size: this.localFiles[file].length };
        // We assume the remote file is up-to-date and doesn't need to be sent.
      }
    }
  }

  // This method updates the local files with the deltas received from the remote side.
  receiveDelta(delta) {
    for (let file in delta) {
      if (this.localFiles[file]) { // If it exists in our local list
        if (delta[file].from === 'remote') { // We got a new version of this file
          // Replace our old data with the new data from the remote side.
          this.localFiles[file] = delta[file].data;
        } else if (delta[file].size !== this.localFiles[file].length) { // If we got an updated version but the size didn't change
          // We need to update the local file, so send the updated version back to the remote side.
          this.difference[file] = {
            from: 'local',
            data: delta[file].data,
            size: delta[file].size
          };
        }
      } else { // If it doesn't exist in our list
        this.localFiles[file] = delta[file].data;
      }
    }
  }

  sync() {
    this.syncDelta();
    for (let file in this.remoteFiles) {
      if (!this.localFiles[file]) {
        this.difference[file] = { from: 'remote', data: this.remoteFiles[file], size: this.remoteFiles[file].length };
      }
    }
    // Send the differences back to the remote side.
    return this.difference;
  }
}
```