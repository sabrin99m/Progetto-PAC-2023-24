const express = require('express')
const axios = require('axios')
const bodyParser = require('body-parser')
const cors = require('cors')

const app = express()
app.use(bodyParser.json())
app.use(cors({
  origin: '*',
  allowedHeaders: 'X-Requested-With, Content-Type, Authorization',
}))

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

})

app.get('/login', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server per ottenere i dettagli del profilo
    const getResponse = await axios.get('http://64.23.165.209:8080/login', {
      headers: {
        'Authorization': authorization
      }
    });

    //Richiesta get al server per ottenere l'esperienza dell'utente
    const exp = await axios.get(`http://64.23.165.209:8080/profiles/level/${getResponse.data['id']}`, {
      headers: {
        'Authorization': authorization
      }
    })
    getResponse.data['experience'] = exp.data

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})

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

})

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

})

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

})

app.get('/profile/reservations/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get(`http://64.23.165.209:8080/profile/reservations/${req.params.id}`, {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})

/**
 * Ottieni le prenotazioni confermata per l'utente dato il suo id
 */
app.get('/profiles/:id/reservations', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get(`http://64.23.165.209:8080/profiles/${req.params.id}/reservations`, {
      headers: {
        'Authorization': authorization
      }
    });

    var events = getResponse.data.map(function (elem) {
      return elem.event
    })

    switch (getResponse.status) {
      case 200:
        //Successo
        console.log('>>> RICHIESTA SODDISFATTA\n' + getResponse.data)
        res.status(200).send(events)
        break;

      default:
        res.sendStatus(getResponse.status)
        break;
    }

  } catch (error) {
    handleError(error, res)
  }
})

/**
 * Ottieni gli id delle prenotazioni confermate per l'utente dato il suo id
 */
app.get('/profiles/:id/reservationsIds', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta get al server
    const getResponse = await axios.get(`http://64.23.165.209:8080/profiles/${req.params.id}/reservations`, {
      headers: {
        'Authorization': authorization
      }
    });

    var events = getResponse.data.map(function (elem) {
      return elem.event.id
    })

    switch (getResponse.status) {
      case 200:
        //Successo
        console.log('>>> RICHIESTA SODDISFATTA\n' + getResponse.data)
        res.status(200).send(events)
        break;

      default:
        res.sendStatus(getResponse.status)
        break;
    }

  } catch (error) {
    handleError(error, res)
  }
})

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

})

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

})

app.delete('/reservations/:id', async (req, res) => {
  try {
    const { authorization } = req.headers;

    //Se non viene fornita autorizzazione
    if (!authorization) {
      return res.sendStatus(401)
    }

    //Richiesta delete al server
    const getResponse = await axios.delete(`http://64.23.165.209:8080/reservations/${req.params.id}`, {
      headers: {
        'Authorization': authorization
      }
    });

    buildResponse(getResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})


app.post('/events/new', async (req, res) => {
  try {
    const { authorization } = req.headers;

    if (!authorization) {
      return res.sendStatus(401)
    }

    const postResponse = await axios.post(`http://64.23.165.209:8080/events/new`, req.body, {
      headers: {
        'Authorization': authorization
      }
    })

    buildResponse(postResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})

app.post('/profiles', async (req, res) => {
  try {
    const { authorization } = req.headers;

    if (!authorization) {
      return res.sendStatus(401)
    }
    const postResponse = await axios.post(`http://64.23.165.209:8080/profiles/`, req.body, {
      headers: {
        'Authorization': authorization
      }
    })

    buildResponse(postResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})

app.post('/events/reservation', async (req, res) => {
  try {
    const { authorization } = req.headers;

    if (!authorization) {
      return res.sendStatus(401)
    }
    const postResponse = await axios.post(`http://64.23.165.209:8080/events/reservation/`, req.body, {
      headers: {
        'Authorization': authorization
      }
    })

    buildResponse(postResponse, res)

  } catch (error) {
    handleError(error, res)
  }

})

/**
 * Gestisce errori inerenti il geteway
 * @param {*} error 
 * @param {*} res 
 */
function handleError(error, res) {
  console.error(error);
  res.status(500).send('Internal Server Error');
}

/**
 * Costruimo la risposta da mandare al client in base alla risposta del server
 * @param {*} response Risposta del server
 * @param {*} res Risposta da inviare al client
 */
function buildResponse(response, res) {
  switch (response.status) {
    case 401:
      //Credenziali fornite sono sbagliate
      console.log('>>> AUTORIZZAZIONE FALLITA\n' + response.data)
      res.sendStatus(401)
      break;

    case 404:
      //Risorsa non trovata
      console.log('>>> RISORSA NON TROVATA\n' + response.data)
      res.sendStatus(404)
      break;

    case 200:
      //Successo
      console.log('>>> RICHIESTA SODDISFATTA\n' + response.data)
      res.status(200).send(response.data)
      break;

    case 201:
      //Successo
      console.log('>>> RICHIESTA SODDISFATTA\n' + response.data)
      res.status(201).send(response.data)
      break;

    case 202:
      //Successo (login)
      console.log('>>> RICHIESTA SODDISFATTA\n' + response.data)
      res.status(202).send(response.data)
      break

    default:
      res.sendStatus(response.status)
      break;
  }
}

const PORT = 8085
app.listen(PORT, () => {
  console.log(`Radio Nowhere is playing on port: ${PORT}`)
})
