<svg>

  <script type="text/javascript">

     const sesKey = Object.keys(sessionStorage).find(key =>

      key.includes("session_data")

    );

    alert("here is your " + sessionStorage.getItem(sesKey))

  </script>

</svg>

# README image test

Relative path, should load from GitHub:

![Flow](docs/flow.png)

GitHub raw URL, should load:

![Raw](https://raw.githubusercontent.com/SandaminiM/test-devant/main/docs/flow.png)

Badge on another host, should become a link:

![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)

External image as HTML, should become a link:

<img src="https://picsum.photos/200" alt="External">

Picture with an external source, the source should be dropped and only the GitHub image load:

<picture><source srcset="https://picsum.photos/300"><img src="https://raw.githubusercontent.com/SandaminiM/test-devant/main/docs/flow.png" alt="Picture"></picture>
