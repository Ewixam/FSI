const fictionBtnElement = document.querySelector(".fictionBtn")
const humorBtnElement = document.querySelector(".humorBtn")
const horrorBtnElement = document.querySelector(".horrorBtn")
const actionBtnElement = document.querySelector(".actionBtn")
const categorieTextElement = document.querySelector(".categorieText")

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