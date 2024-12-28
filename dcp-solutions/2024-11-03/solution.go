```markdown
package main

import (
	"container/heap"
	"fmt"
	"math/rand"
	"net/http"
	"strings"
	"time"

	"gopkg.in/mgo.v4/collection"
)

const maxBytes = 10 * 1024 * 1024 // 10MB

type URL struct {
	Short string
.URL   string
}

var shortURLs = make(collection.Map[string, string])

func init() {
	rand.Seed(time.Now().UnixNano())
}

type Node struct {
	URL    string
	Short string
}

type PriorityQueue []*Node

func (pq PriorityQueue) Len() int           { return len(pq) }
func (pq PriorityQueue) Less(p, q *Node) bool { return pq[p].Short < pq[q].Short }
func (pq PriorityQueue) Swap(p, q int)       { (*pq)[p], (*pq)[q] = (*pq)[q], (*pq)[p] }

func (pq *PriorityQueue) Push(x any)        { *pq = append(*pq, x.(*Node)) }
func (pq *PriorityQueue) Pop() (any, bool)  { old := (*pq)[len(*pq)-1]; *pq = (*pq)[:len(*pq)-1]; return old, true }

type URLShortener struct {
}

func (s *URLShortener) shorten(url string) (string, error) {
	if len(url) > maxBytes {
		return "", fmt.Errorf("url too long")
	}
	short := randAlpha()
	if shortURLs.Get(short) != nil && shortURLs.Get(short).URL == url {
		return shortURLs.Get(short).(string), nil
	}

	node := &Node{URL: url, Short: short}
	s.addShortURL(short)

	heap.Push(&s.pq, node)
	return short, nil
}

func (s *URLShortener) restore(short string) (string, error) {
	for pq := s.pq; pq.Len() > 0 && (*pq)[0].Short != short; pq = heap.Pop(&pq).(*PriorityQueue) {
	}
	if pq.Len() == 0 || (*pq)[0].Short != short {
		return "", nil
	}

	return (*pq)[0].URL, nil
}

func (s *URLShortener) addShortURL(short string) {
	s.pq = append(s.pq, &Node{URL: s restoresURL(), Short: short})
	if len(s.pq) > 10000 {
		old := (*s.pq)[len(*s.pq)-1]
		*s.pq = (*s.pq)[:len(*s.pq)-1]
		shortURLs.Set(old.Short, old.URL)
	}
}

func (s *URLShortener) restoresURL() string {
	return shortURLs.Get(s.restoresShort()).(string)
}

func randAlpha() string {
	const alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	b := make([]byte, 6)
	for i := range b {
		b[i] = alpha[rand.Intn(len(alpha))]
	}
	return string(b)
}

var urlShortener *URLShortener

func main() {
	urlShortener = &URLShortener{}
	http.HandleFunc("/short", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		if r.Method != "GET" {
			http.Error(w, "Invalid request method.", http.StatusBadRequest)
			return
		}
		url := r.URL.Query().Get("url")
		if len(url) == 0 || len(url) > maxBytes {
			http.Error(w, "URL too long or missing.", http.StatusBadRequest)
			return
		}
		short, err := urlShortener.shorten(url)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		w.Write([]byte(short))
	})
}
```