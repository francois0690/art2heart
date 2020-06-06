const injectUrl = (url) => {
    if (url === undefined || url === "") {
        document.querySelector("#wikiImg").innerText = "Dommage, votre croute n'est pas sur Wikipedia... 🤷‍♂️";
    } else {
      document.querySelector("#wikiImg").innerHTML += '<div class="wikiImage"><img src=' + url + '></div>';
    };
};


let imgURL = ""

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
const input = document.getElementById("piece_name");
const btn = document.getElementById("wikiBtn");
const btnPhoto = document.getElementById("btnPhoto");

btnPhoto.addEventListener("click", (event) => {
  // event.currentTarget.classList.toggle("disabled");
  document.querySelector("#new_piece").innerHTML = `<input class="hidden" name="piece[wikiphoto]" value="${imgURL}">`;
});


btn.addEventListener("click", (event) => {
  // event.currentTarget.classList.toggle("disabled");
  wikiImageSearch(input.value);
});
