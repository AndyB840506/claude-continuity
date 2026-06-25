---
name: ""
metadata: 
  node_type: memory
  originSessionId: 0f445e9b-39d7-417f-9c67-aa2ced2456e8
---

Cuando el usuario pide la descripción de un episodio "en HTML" para Spotify, se refiere a escribir el texto en **marcado HTML** (`<p>` por párrafo, `<a href>` en links) para pegarlo directo en el campo de descripción de Spotify — NO a generar una página `.html` renderizada con estilos/botones.

**Why:** Spotify (y muchas plataformas de podcast) aceptan HTML en la descripción. Usar `<p>` por párrafo preserva el espaciado y evita el bug de palabras pegadas que aparece al pegar texto plano con saltos manuales a mitad de párrafo ("la crisis" → "lacrisis"). A mitad de sesión generé una página HTML con botones de copiar por error; el usuario aclaró que quería el código para pegar.

**How to apply:** entregar la descripción de Spotify como bloque ```html``` con `<p>…</p>` y `<a>`. YouTube NO acepta HTML → ahí va texto plano. Regla ya codificada en [[feedback-html-for-spotify]] → `episode-launch/step2 §A` (BTQ) y `podcast-creator/05-show-notes §C` (MPD).
