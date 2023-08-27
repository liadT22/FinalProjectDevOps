<html>
  <head>
    <title>Echoing HTML Request Parameters</title>
    <script>
        function loadAuthorData(authorName) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'authorData.jsp?name=' + authorName, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    // Handle response if needed
                    console.log(xhr.responseText);
                }
            };
            xhr.send();
        }

        function loadImage(imagePath) {
            var img = document.createElement('img');
            img.src = imagePath;
            document.getElementById('imageContainer').appendChild(img);
        }
    </script>
  </head>
  <body>
    <h3>Choose an author:</h3>
    <form method="get">
      <!-- Checkboxes for Authors with AJAX calls -->
      <input type="checkbox" name="author" value="Tan Ah Teck" onclick="loadAuthorData('Tan Ah Teck')" />Tan
      <input type="checkbox" name="author" value="Mohd Ali" onclick="loadAuthorData('Mohd Ali')" />Ali
      <input type="checkbox" name="author" value="LiadT3" onclick="loadAuthorData('LiadT3')" />LiadT3

      <!-- Textboxes -->
      <h3>Enter Book Title and Year:</h3>
      Title: <input type="text" name="title" /><br>
      Year: <input type="text" name="year" /><br>

      <!-- Selection Menu (Drop-down list) -->
      <h3>Select Book Genre:</h3>
      <select name="genre">
        <option value="Fiction">Fiction</option>
        <option value="Non-Fiction">Non-Fiction</option>
        <option value="Biography">Biography</option>
        <option value="Children">Children</option>
      </select><br><br>

      <input type="submit" value="Query" />
    </form>

    <!-- Dynamic Content Loading -->
    <button onclick="loadImage('pikachu.png')">Load Image 1</button>
    <button onclick="loadImage('charmander.jpg')">Load Image 2</button>
    <button onclick="loadImage('squirtle.png')">Load Image 3</button>
    <button onclick="loadImage('bulbasaur.png')">Load Image 4</button>
    <div id="imageContainer"></div>

    <% 
    String[] authors = request.getParameterValues("author"); 
    String title = request.getParameter("title");
    String year = request.getParameter("year");
    String genre = request.getParameter("genre");
    if (authors != null) { 
    %>
    <h3>You have selected author(s):</h3>
    <ul>
      <% for (int i = 0; i < authors.length; ++i) { %>
      <li><%= authors[i] %></li>
      <% } %>
    </ul>
    <h3>Book Details:</h3>
    <p>Title: <%= title %></p>
    <p>Year: <%= year %></p>
    <p>Genre: <%= genre %></p>

    <a href="<%= request.getRequestURI() %>">BACK</a>
    <% } %>
  </body>
</html>
