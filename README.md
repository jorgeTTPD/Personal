# 💣 PBombardero

*My first complete program in Delphi 12 — a WhatsApp message bomber.*
**Mi primer programa completo en Delphi 12: un bombardero de mensajes para WhatsApp.**

![Captura de pantalla](Captura%20de%20pantalla%202026-08-12%20174134.png)

## 📖 ¿Qué hace? · *What it does*

Escribe automáticamente un mensaje las veces que quieras en la ventana activa (por ejemplo, WhatsApp), simulando el teclado con la API de Windows `SendInput` en modo **Unicode**.

*It automatically types a message as many times as you want into the active window (e.g. WhatsApp), simulating the keyboard with the Windows `SendInput` API in **Unicode** mode.*

## ✨ Características · *Features*

- ⌨️ Envío por simulación de teclado real (`SendInput` + `KEYEVENTF_UNICODE`) · *Real keyboard simulation*
- 🔁 Número de envíos configurable, con pausa de 3 segundos entre cada uno · *Configurable repeat count with a 3-second pause*
- 🔊 Reproduce un sonido al terminar · *Plays a sound when finished*
- 🖥️ Interfaz gráfica simple: mensaje, veces, botones **Empezar** y **CERRAR** · *Simple GUI*

## 🚀 Cómo usarlo · *How to use*

1. Abre la app y escribe el mensaje en el campo **Mensaje**.
2. Indica cuántas veces enviarlo en **Numero de veces**.
3. Presiona **Empezar**: tendrás 5 segundos para dejar enfocada la ventana de WhatsApp.
4. ¡Listo! El programa envía el mensaje en bucle y avisa al terminar.

## 🛠️ Compilación · *Build*

- **Delphi 12** (RAD Studio / Embarcadero)
- Abre `Bpombardero/Bombproject.dpr` y compila (F9).
- También puedes usar el ejecutable incluido: `gagaproject.exe`

## 📂 Estructura · *Structure*

```
├── Bpombardero/
│   ├── Bombproject.dpr        # Proyecto principal · Main project
│   ├── bombSight.pas          # Lógica del envío (SendInput) · Sending logic
│   └── bombSight.dfm          # Interfaz visual · Visual form
└── gagaproject.exe            # Ejecutable compilado · Compiled executable
```

## ⚠️ Aviso · *Disclaimer*

Proyecto personal con fines educativos. Úsalo solo en tus propios dispositivos y con responsabilidad.

*Personal project for educational purposes. Use it only on your own devices and responsibly.*
