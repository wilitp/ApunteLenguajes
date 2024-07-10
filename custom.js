
// Identificar custom items usados en el latex

const customItems = Array.from(document.querySelectorAll("li")).filter(
  li => li.textContent?.includes("adhocprefix")
)

for (const customItem of customItems) {

  // obtener el item entre los delimitadores adhoc
  const itemText = customItem.textContent?.match(/adhocprefix(.*)adhocsufix/, "")[1]?.trim() ?? ""

  // quitar el texto que identifica al custom item
  customItem.textContent = customItem.textContent?.replace(/adhocprefix.*adhocsufix/, "") ?? ""

  // quitar marker original
  customItem.classList.add("no-marker");

  // agregar item custom al principio, como si fuera el marker
  customItem.textContent = itemText + " " + customItem.textContent
}
