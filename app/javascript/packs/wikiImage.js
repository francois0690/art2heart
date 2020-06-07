// Query Selectors :
// ------------------

const input = document.getElementById("piece_name");
const searchBtn = document.getElementById("wikiBtn");
const btnPhoto = document.getElementById("btnPhoto");
const photoURL = document.getElementById("wikiImg");



// Fonctions :
// -----------

const injectUrl = (url) => {
    if (url === undefined || url === "") {
        photoURL.innerText = "Dommage, votre croute n'est pas sur Wikipedia... 🤷‍♂️";
    } else {
        photoURL.innerText = "Aperçu :"
        photoURL.innerHTML += '<div class="wikiImage"><img src=' + url + '></div>';
        btnPhoto.classList.toggle("hidden")
    };
};


const wikiImageSearch = (query) => {
  fetch(`http://fr.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages&titles=${query}&piprop=thumbnail&pithumbsize=324&imlimit=5&origin=*`)
      .then(response => response.json())
      .then((data) => {
          const myId = Object.keys(data.query.pages)[0];
          const imgURL = data.query.pages[myId].thumbnail.source;
          injectUrl(imgURL)
      });
}



// Event Listenenrs :
// ------------------

searchBtn.addEventListener("click", () => {
    wikiImageSearch(input.value);
});


btnPhoto.addEventListener("click", () => {
    const photoSrc = photoURL.firstElementChild.firstChild.src
    const wikiInput = document.createElement("input");
    wikiInput.setAttribute("type", "hidden");
    wikiInput.setAttribute("name", "piece[wikiphoto]");
    wikiInput.setAttribute("value", photoSrc);
    //append to form element that you want .
    document.getElementById("new_piece").appendChild(wikiInput);
});
