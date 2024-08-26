package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
)

func TestHelloHandler(t *testing.T) {
    req := httptest.NewRequest("GET", "/", nil)
    w := httptest.NewRecorder()
    helloHandler(w, req)

    resp := w.Result()
    if resp.StatusCode != http.StatusOK {
        t.Errorf("expected status %d; got %d", http.StatusOK, resp.StatusCode)
    }

    body := w.Body.String()
    expected := "Hello, World!\n"
    if body != expected {
        t.Errorf("expected body %q; got %q", expected, body)
    }
}
