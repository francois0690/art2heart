const name = document.querySelector("#piece-name").innerText;

// document.addEventListener('turbolinks:load', () => {


const injectText = (text) => {
    if (text === undefined || text === "") {
        document.querySelector("#wikipedia").innerText = "Dommage, votre croute n'est pas sur Wikipedia... 🤷‍♂️";
    } else {
        document.querySelector("#wikipedia").innerText = text;
    };
};

const wikiInfoSearch = (query) => {
    fetch(`http://fr.wikipedia.org/w/api.php?action=query&format=json&uselang=user&prop=extracts&list=&titles=${query}&exsentences=3&exintro=1&explaintext=1?&origin=*`)
        .then(response => response.json())
        .then((data) => {
            const myId = Object.keys(data.query.pages)[0];
            const text = data.query.pages[myId].extract;
            injectText(text);
        });
};

wikiInfoSearch(name);
