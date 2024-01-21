const express = require('express');
const axios = require('axios');

const app = express();

app.get('/', async (_, res) => {
  res.status(200).send("This is Radio Nowhere, is there anybody alive out there?")
})

app.get('/events', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get('http://64.23.165.209:8080/events', {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

});

function handleError(error, res) {
  console.error(error);
  res.status(500).send('Internal Server Error');
}

function buildResponse(response, res) {
  switch (response.status) {
    case 401:
      //Credenziali fornite sono sbagliate
      res.sendStatus(401)
      break;

    case 200:
      //Successo
      res.status(200).send(response.data)
      break;

    default:
      res.send(response.data)
      break;
  }
}

const PORT = 8085
app.listen(PORT, () => {
  console.log(`Gateway is running on port: ${PORT}`);
});
