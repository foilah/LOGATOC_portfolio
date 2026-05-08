console.log("LOGATOC Academic Portfolio loaded successfully.");

// Typewriter effect for hero text
function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.innerHTML = '';
    function type() {
        if (i < text.length) {
            element.innerHTML += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }
    type();
}

// Floating animation for background shapes
function animateShapes() {
    const shapes = document.querySelectorAll('.bg-shape');
    shapes.forEach((shape, index) => {
        shape.style.animation = `float${index + 1} 20s ease-in-out infinite`;
    });
}

// Scroll animations
function initScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);

    // Observe all sections
    document.querySelectorAll('section').forEach(section => {
        observer.observe(section);
    });

    // Observe about grid
    const aboutGrid = document.querySelector('.about-grid');
    if (aboutGrid) observer.observe(aboutGrid);

    // Observe bento cards
    document.querySelectorAll('.bento-card').forEach(card => {
        observer.observe(card);
    });

    // Observe certificate cards
    document.querySelectorAll('.certificate-card').forEach(card => {
        observer.observe(card);
    });
}

// Particle system for aesthetic background
function createParticles() {
    const particleContainer = document.createElement('div');
    particleContainer.className = 'particle-container';
    document.body.appendChild(particleContainer);

    // Create floating code elements
    const codeElements = ['{ }', '</>', '()', '[]', '<html>', 'function', 'var', 'const', '=>', 'class'];
    
    for (let i = 0; i < 30; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        
        // Randomly choose between particle or code element
        if (Math.random() > 0.7) {
            particle.textContent = codeElements[Math.floor(Math.random() * codeElements.length)];
            particle.classList.add('code-particle');
        }
        
        particle.style.left = Math.random() * 100 + '%';
        particle.style.top = Math.random() * 100 + '%';
        particle.style.animationDelay = Math.random() * 20 + 's';
        particleContainer.appendChild(particle);
    }
}

// Initialize animations when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Typewriter effect for the motto
    const mottoElement = document.querySelector('.hero-motto h3');
    if (mottoElement) {
        const originalText = mottoElement.textContent;
        typeWriter(mottoElement, originalText, 150);
    }

    // Animate background shapes
    animateShapes();

    // Initialize scroll animations
    initScrollAnimations();

    // Create particle system
    createParticles();
});