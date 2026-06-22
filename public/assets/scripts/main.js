const inicio = document.querySelector('a[href="#inicio"]')
const nosotros = document.querySelector('a[href="#nosotros"]')
const impacto = document.querySelector('a[href="#impacto"]')
const contacto = document.querySelector('a[href="#contacto"]')

/*Menu Inicio*/
inicio?.addEventListener("click", (i) => {
    i.preventDefault();
    const sectionI = document.querySelector("#inicio")
    sectionI?.scrollIntoView({behavior: "smooth"})
})

/*Menu Nosotros*/
nosotros?.addEventListener("click", (n) => {
    n.preventDefault();
    const sectionN = document.querySelector("#nosotros")
    sectionN?.scrollIntoView({behavior: "smooth"})
})

/*Menu Impacto*/
impacto?.addEventListener("click", (im) => {
    im.preventDefault();
    const sectionIm = document.querySelector("#impacto")
    sectionIm?.scrollIntoView({behavior: "smooth"})
})

/*Menu Contacto*/
contacto?.addEventListener("click", (c) => {
    c.preventDefault();
    const sectionC = document.querySelector("#contacto")
    sectionC?.scrollIntoView({behavior: "smooth"})
})
