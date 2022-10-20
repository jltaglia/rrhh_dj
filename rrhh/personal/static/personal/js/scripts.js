//
// TODAS ESTAS FUNCIONES QUEDARON DE EL PROYECTO FRONTEND 
// POR LAS DUDAS QUE ALGUNA SIRVIERA PARA EL PROYECTO BACKEND
//



document.getElementById("mi_footer").innerHTML = `
    <div class="social">
        <span><a href="https://www.facebook.com/profile.php?id=100075834332674" target="_blank"
                class="icon-facebook"><i class="fa-brands fa-facebook-square"></i></a></span>
        <span><a href="http://www.twitter.com/@JLPatagonico" target="_blank" class="icon-twitter"><i
                    class="fa-brands fa-twitter-square"></i></a></span>
        <span><a href="https://www.instagram.com/vendotodorawson/" target="_blank" class="icon-instagram"><i
                    class="fa-brands fa-instagram"></i></a></span>
        <span><a href="https://ar.pinterest.com/vendotodorawson/vendo-todo-por-mudanza/" target="_blank"
                class="icon-pinterest"><i class="fa-brands fa-pinterest-square"></i></a></span>
        <span><a href="mailto:vendotodorawson@gmail.com" class="icon-mail"><i
                    class="fa-solid fa-square-envelope"></i></a></span>
    </div>
`;


// ------------------------------ PARA CARGAR EL MENU SEGUN LA PAG ACTIVA ------------------------------
var pagina = document.title
var opciones = [ "<a href=\"./index.html\"><i class=\"fa-solid fa-house\"></i></a>", 
                "<a href=\"./articulos.html\">Mis Articulos</a>",
                "<a href=\"./acerca.html\">Nosotros</a>",
                "<a href=\"./contacto.html\">Contacto</a>"
                ];

switch (pagina) {
    case "Vendo Todo Por Mudanza!":
        opciones[0] = "<a href=\"./index.html\"><i class=\"fa-solid fa-house active\"></i></a>";
        break

    case "VTxM! - Mis Articulos":
        opciones[1] = "<a href=\"#Articulos\" class=\"active\">Mis Articulos</a>";
        break

    case "VTxM! - Acerca de Nosotros":
        opciones[2] = "<a href=\"#acerca\" class=\"active\">Nosotros</a>";
        break

    case "VTxM! - Contacto":
        opciones[3] = "<a href=\"#contacto\" class=\"active\">Contacto</a>";
        break
}
var header_completo = `
    <div class="topnav" id="miTopnav">
        ${opciones[0]}
        ${opciones[1]}
        ${opciones[2]}
        ${opciones[3]}
        <a href="javascript:void(0);" class="icon" onclick="funMenu()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
    `;
document.getElementById("mi_header").innerHTML = header_completo;

// ----------------------- PARA HACER RESPONSIVE EL MENU -----------------------
function funMenu() {
    var x = document.getElementById("miTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
};
