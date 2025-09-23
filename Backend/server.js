require("dotenv").config();
const express = require('express');
const bodyParser = require('body-parser');
const connectDB = require('./config/db');
const userRoutes = require('./routes/userRoutes');
const routes = require('./routes/authRoutes')
const cors = require('cors');
const app = express();
const PORT = 3000;



app.use(cors());
connectDB();


app.use(bodyParser.json());


app.use('/api/users', userRoutes);
app.use('/api/v1', routes)

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
