export function handleError(error, res) {
  console.error(error);
  res.status(500).send('Internal Server Error');
}

export function buildResponse(response, res) {
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