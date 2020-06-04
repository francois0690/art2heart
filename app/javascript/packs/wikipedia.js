const name = document.querySelector(".piece-name").innerText

// document.addEventListener('turbolinks:load', () => {


const inject = (text) => {
  document.querySelector("#test").innerText = text
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
