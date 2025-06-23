const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Node.js App Running'));
app.listen(80);