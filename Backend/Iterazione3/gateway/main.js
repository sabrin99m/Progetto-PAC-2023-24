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

app.get('/events/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get(`http://64.23.165.209:8080/events/${req.params.id}`, {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

});

app.get('/profiles', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get('http://64.23.165.209:8080/profiles', {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

});

app.get('/profiles/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get(`http://64.23.165.209:8080/profiles/${req.params.id}`, {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

});

app.delete('/events/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta delete al server
    const getResponse = await axios.delete(`http://64.23.165.209:8080/events/${req.params.id}`, {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

});

app.delete('/profiles/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta delete al server
    const getResponse = await axios.delete(`http://64.23.165.209:8080/profiles/${req.params.id}`, {
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

    case 404:
      //Risorsa non trovata
      res.sendStatus(404)

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
