// Query Selectors :
// ------------------

const input = document.getElementById("piece_name");
const searchBtn = document.getElementById("wikiBtn");
const btnPhoto = document.getElementById("btnPhoto");
const photoURL = document.getElementById("wikiImg");


// Constante :
// -----------
let imgURL = ""




// Fonctions :
// -----------


const injectUrl = (url) => {
    if (url === undefined || url === "") {
        document.querySelector("#wikiImg").innerText = "Dommage, votre croute n'est pas sur Wikipedia... 🤷‍♂️";
    } else {
      document.querySelector("#wikiImg").innerHTML += '<div class="wikiImage"><img src=' + url + '></div>';
    };
};



const wikiImageSearch = (query) => {
  fetch(`http://fr.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages&titles=${query}&piprop=thumbnail&pithumbsize=600&imlimit=5&origin=*`)
      .then(response => response.json())
      .then((data) => {
        const myId = Object.keys(data.query.pages)[0];
        let imgURL = data.query.pages[myId].thumbnail.source;
        injectUrl(imgURL)
        // wikiImageUrl(shortUrls);
      });
}



// https://commons.wikimedia.org/wiki/File:1665_Girl_with_a_Pearl_Earring.jpg
// https://en.wikipedia.org/wiki/Special:ApiSandbox#action=query&format=json&prop=images&iwurl=1&titles=Guernica&imlimit=5



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
  console.log(photoSrc)
});
