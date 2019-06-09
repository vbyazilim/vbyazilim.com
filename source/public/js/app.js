document.addEventListener('DOMContentLoaded', () => {

    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
    if ($navbarBurgers.length > 0) {
        $navbarBurgers.forEach( el => {
            el.addEventListener('click', () => {
                const target = el.dataset.target;
                const $target = document.getElementById(target);
                el.classList.toggle('is-active');
                $target.classList.toggle('is-active');
            });
        });
    }

    const $zoomable_images = document.querySelectorAll('.zoomable img');
    if($zoomable_images.length > 0){
        $zoomable_images.forEach(el => {
            el.addEventListener('click', () => {
                el.classList.toggle('zoom');
            });
        });
    }
    
    const $external_links = document.querySelectorAll('a.is-external-link');
    if($external_links.length > 0){
        $external_links.forEach(el => {
            el.setAttribute('target', '_blank');
        });
    }
    
});



