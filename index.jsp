<html>
  <head>
    <title>Echoing HTML Request Parameters</title>
    <script>
      var imageCounter = 0; // Counter to keep track of the current image

      function loadImage(imagePath) {
        var img = document.createElement("img");
        img.src = imagePath;
        document.getElementById("imageContainer").appendChild(img);
      }

      function loadNextImage() {
        var nextImage = "pokemon/" + imageCounter + ".png";
        loadImage(nextImage);
        imageCounter = (imageCounter + 1) % 200; // Loop back to 0 after reaching 199
      }
    </script>
  </head>
  <body>
    <!-- Dynamic Content Loading -->
    <button onclick="loadNextImage()">Load Next Image!</button>
    <div id="imageContainer"></div>
  </body>
</html>
