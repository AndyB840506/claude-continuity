---
name: feedback_digitalocean_deploy
description: "Gotchas de DigitalOcean App Platform: plan, env vars, URL, rebuild"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 99603a47-a605-4c8c-a8bd-2bb44d054bac
---

Cuatro reglas para deployar en DigitalOcean App Platform:

**1. El plan default NO es $5** — Viene seleccionado en plan más caro (1GB RAM, 2 containers = $24/mo). Hay que bajar manualmente a 512MB RAM / 1 container / $5/mo antes de crear la app.

**2. "Add from .env" abre editor de texto, no file picker** — No sube el archivo, abre un textarea donde hay que pegar el contenido del .env manualmente.

**3. Renombrar la app NO cambia la URL** — El ID aleatorio en la URL (`appname-tjom4.ondigitalocean.app`) es fijo. Solo cambia el display name en el dashboard.

**4. Force rebuild + clear cache borra las env vars** — Si se hace "Force rebuild and deploy" con clear cache, las variables de entorno se eliminan y hay que reconfigurarlas. Advertir al usuario antes de hacer clear cache.

**Why:** Errores descubiertos en deploy real de andyfreelancer.com — cada uno causó confusión o retrabajo.

**5. IDs de Google Sheets/Drive — siempre copiar desde la URL del browser** — Nunca dictar ni recordar IDs de memoria. Siempre pedir al usuario que abra el recurso, mire la barra de direcciones y copie el ID directamente. Un carácter incorrecto (`8` vs `B`, `KJ` vs `KjJ`) causa "File not found" / "Entity not found" y el debugging toma horas porque el error apunta a permisos, no al ID.

**How to apply:** Al guiar un deploy en DO App Platform, mencionar estos 5 puntos proactivamente antes de que el usuario llegue a cada paso. Para IDs de Google APIs, pedir screenshot de la URL o que el usuario copie-pegue directamente — nunca confiar en IDs escritos de memoria.
