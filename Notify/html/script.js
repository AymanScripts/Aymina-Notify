window.addEventListener('message', function(event) {
    if (event.data.action === 'showNotify') {
        const notification = document.createElement('div');
        notification.classList.add('notification', event.data.type);

        // Voeg de positieklasse toe
        notification.classList.add(event.data.position);

        // Stel de icon en de kleur van de icon in
        const icon = document.createElement('i');
        icon.className = `fa ${event.data.icon}`;
        icon.style.color = event.data.iconColor;

        const textContainer = document.createElement('div');
        textContainer.classList.add('text-container');

        const title = document.createElement('span');
        title.classList.add('title');
        title.textContent = event.data.title || '';  // Als er geen titel is, gebruik een lege string
        
        // Stel de tekstkleur in voor de titel
        title.style.color = event.data.textColor || '#ffffff';  // Gebruik textColor of default naar wit

        const description = document.createElement('span');
        description.classList.add('description');
        description.textContent = event.data.description || '';  // Als er geen beschrijving is, gebruik een lege string
        
        // Stel de tekstkleur in voor de beschrijving
        description.style.color = event.data.textColor || '#ffffff';  // Gebruik textColor of default naar wit

        textContainer.appendChild(title);
        textContainer.appendChild(description);

        // Voeg de progressbar toe
        const progressBar = document.createElement('div');
        progressBar.className = 'progress';
        progressBar.style.animationDuration = `${event.data.duration / 1000}s`;

        // Zet de kleur van de progressbar op basis van de waarde uit de config
        progressBar.style.backgroundColor = event.data.progressBarColor || "#28a745";  // Fallback naar standaardkleur als er geen kleur is

        // Zet de left border kleur op basis van de waarde uit de config
        notification.style.borderLeftColor = event.data.leftBorderColor || "#28a745";  // Fallback naar standaardkleur als er geen kleur is

        // Zet de achtergrondkleur op basis van de waarde uit de config
        notification.style.backgroundColor = event.data.backgroundColor || "#2c2c2c";  // Fallback naar standaardkleur als er geen kleur is

        // Voeg alle elementen samen
        notification.appendChild(icon);
        notification.appendChild(textContainer);
        notification.appendChild(progressBar);

        // Voeg de notificatie toe aan de pagina
        document.getElementById('notifications').appendChild(notification);

        // Na de verstreken tijd, verwijder de notificatie
        setTimeout(() => {
            notification.style.animation = 'fadeOut 0.5s forwards';
            setTimeout(() => { notification.remove(); }, 500);
        }, event.data.duration);
    }
});
