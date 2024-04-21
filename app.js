const express = require('express');
const sql = require('mssql/msnodesqlv8');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

const dbConfig = {
  server: 'DESKTOP-NUK9DQJ\\SQLEXPRESS',
  database: 'model',
  driver: 'msnodesqlv8',
  options: {
    trustedConnection: true,
    requestTimeout: 300000 // 5 minutes (adjust as needed)
  }
};

app.post('/api/signup', (req, res) => {
  const {  customer_name, gender, email, uname, pass,description,contact } = req.body;

  sql.connect(dbConfig, function(err) {
    if (err) {
      console.log(err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    var request = new sql.Request();
    request.query(`INSERT INTO customer ( customer_name, gender, email, uname, pass,description,contact) 
                   VALUES ('${customer_name}', '${gender}', '${email}', '${uname}', '${pass}','${description}','${contact}')`,
                   function(err, result) {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }
      
      console.log('Data inserted successfully:', result);
      res.status(200).json({ message: 'Data inserted successfully!' });
    });
  });
});


app.post('/api/login', (req, res) => {
  const { uname, pass } = req.body;

  const loginQuery = `SELECT * FROM customer WHERE uname = '${uname}' AND pass = '${pass}'`;
  
  sql.connect(dbConfig, function(err) {
    if (err) {
      console.error('Database connection error:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    const request = new sql.Request();
    
    request.query(loginQuery, function(err, result) {
      if (err) {
        console.error('Database query error:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      if (result.recordset.length === 0) {
        return res.status(401).json({ error: 'Invalid username or password' });
      }

      // Redirect to customer dashboard upon successful login
      return res.status(200).json({ redirectTo: '/customer/dashboard' });
    });
  });
});

app.listen(port, () => {
  console.log(`Server is running at http://192.168.1.31:${port}`);
});
