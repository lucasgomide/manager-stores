wrk.method = "POST"
wrk.body   = "{query: {getPDV(id: 10){ownerName address{coordinates}}}}"
wrk.headers["Content-Type"] = "multipart/form-data"
