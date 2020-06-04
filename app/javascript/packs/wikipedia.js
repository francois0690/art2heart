const name = document.querySelector(".piece-name").innerText

// document.addEventListener('turbolinks:load', () => {


const inject = (text) => {
  if (text === undefined || text === "") {
    console.log("croute")
    document.querySelector("#wikipedia").innerText = "Dommage votre croute n'est pas sur Wikipedia... 🤷‍♂️"
  } else {
    console.log("wiki")
    console.log(text)
    document.querySelector("#wikipedia").innerText = text
  }
}

const wikiSearch = (query) => {
  fetch(`http://fr.wikipedia.org/w/api.php?action=query&format=json&uselang=user&prop=extracts&list=&titles=${query}&exsentences=3&exintro=1&explaintext=1?&origin=*`)
        .then(response => response.json())
        .then((data) => {
          const myId = Object.keys(data.query.pages)[0];
          const text = data.query.pages[myId].extract
          inject(text)
            });
}

wikiSearch(name);
