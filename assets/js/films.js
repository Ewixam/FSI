const fictionBtnElement = document.querySelector(".fictionBtn")
const humorBtnElement = document.querySelector(".humorBtn")
const horrorBtnElement = document.querySelector(".horrorBtn")
const actionBtnElement = document.querySelector(".actionBtn")
const categorieTextElement = document.querySelector(".categorieText")
//DIV IMG
const img = document.querySelector(".imgs")

window.onload = init();

function init()
{
    submitForm()
}

function submitForm()
{ 
    const xhr = new XMLHttpRequest();

    xhr.onreadystatechange  = function() 
    { 
       if(xhr.readyState  == 4)
       {    
        if(xhr.status  == 200)
            console.log(xhr.responseText);
        else
            console.log(xhr.status);
        }
    }; 
 
   xhr.open('POST', './assets/php/film.php?action=init');
   xhr.send();
} 

fictionBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Fantastic"

    const imgElement = document.querySelector(".img")
    img.src = "./assets/images/arcane.jpg"
})

humorBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Humor"

    const imgElement = document.querySelector(".img")
    img.src = "./assets/images/avatar.jpg"
})

horrorBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Horror"

    const imgElement = document.querySelector(".img")
    img.src = "./assets/images/bith.jpg"
})

actionBtnElement.addEventListener('click', () =>
{
    categorieTextElement.textContent = "Action"

    const imgElement = document.querySelector(".img")
    img.src = "./assets/images/bith.jpg"
})