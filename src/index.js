import express from "express"
import path from "path"

const app = express()
const port = process.env.PORT || 3000

app.get('*', (req, res) => res.sendFile(path.resolve(__dirname,'index.html')))

app.listen(port, () => console.log(`Server listening on port ${port}`))