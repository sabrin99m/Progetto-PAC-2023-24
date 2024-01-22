# Progetto di PAC aa.2023-24: Mountain App 🏔️

## Membri del team

| Nome e Cognome | Matricola | Mail
| --- | --- | --- |
| Federico Imberti | 1066358 | f.imberti@studenti.unibg.it
| Cristian Tironi | 1064464 | c.tironi1@studenti.unibg.it
| Stefano Gregis | 1073328 | s.gregis4@studenti.unibg.it
| Sabrin Maatoug | 1065576 | s.maatoug@studenti.unibg.it

## Continuous Integration
### Ambiente di Sviluppo
 [![Development - Costruisci e Pubblica l'immagine del backend](https://github.com/FI-153/Progetto-PAC-2023-24/actions/workflows/Build_Push_Server_Dev.yml/badge.svg?branch=main)](https://github.com/FI-153/Progetto-PAC-2023-24/actions/workflows/Build_Push_Server_Dev.yml)

> [!TIP]
> Per lanciare l'immagine compilata: `docker run freddy153/ventura_boulevard:latest-development`
> 
> Per copiare in locale l'immagine compilata: `docker pull freddy153/ventura_boulevard:latest-development`

> [!IMPORTANT]
> L'immagine dell'ambiente di sviluppo viene ricreata ad ogni `push` del branch `main`

### Ambiente di Produzione
[![Production - Costruisci e Pubblica l'immagine del backend](https://github.com/FI-153/Progetto-PAC-2023-24/actions/workflows/Build_Push_Server_Prod.yml/badge.svg)](https://github.com/FI-153/Progetto-PAC-2023-24/actions/workflows/Build_Push_Server_Prod.yml)

> [!TIP]
> Per lanciare l'immagine compilata: `docker run freddy153/ventura_boulevard:latest-production`
> 
> Per copiare in locale l'immagine compilata: `docker pull freddy153/ventura_boulevard:latest-production`

> [!IMPORTANT]
> L'immagine dell'ambiente di produzione viene ricreata ad ogni `push` del branch `production` e viene poi pubblicata sulla macchina virtuale attiva su [Digital Ocean](https://www.digitalocean.com)
