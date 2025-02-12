<style>
footer {
    background: #228B22;  /* Dark Green */
    color: white;
    text-align: center;
    padding: 20px 0;
    font-size: 14px;
    border-top: 3px solid #1e7e1e; /* Subtle separation line */
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    max-width: 1100px;
    margin: auto;
    padding: 10px 20px;
}

.footer-section {
    flex: 1;
    min-width: 220px;
    margin: 5px;
    text-align: left;
}

.footer-section h3 {
    font-size: 16px;
    margin-bottom: 8px;
    color: #c2f0c2; /* Light Green */
}

.footer-section p {
    margin: 4px 0;
}

.footer-section .social {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.footer-section .social a {
    color: white;
    font-size: 30px;  /* Larger icon size */
    margin: 0 20px;   /* Increased space between icons */
    transition: color 0.3s ease;
}

.footer-section .social a:hover {
    color: #c2f0c2;
}

.footer-bottom {
    background: #1e7e1e;
    padding: 8px 0;
    font-size: 12px;
    margin-top: 20px;
    text-align: center;
    color: #e0f5e0;
    border-top: 1px solid #c2f0c2;
}

@media screen and (max-width: 768px) {
    .footer-container {
        flex-direction: column;
        align-items: flex-start;
    }
    .footer-section {
        margin-bottom: 15px;
    }
}
</style>

<footer>
    <div class="footer-container">
        <div class="footer-section about">
            <p>Providing world-class medical services with expert doctors and modern facilities.</p>
        </div>

        <div class="footer-section contact">
            <h3>Contact Us</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123, Green Street, City</p>
            <p><i class="fas fa-phone"></i> +1 234 567 890</p>
            <p><i class="fas fa-envelope"></i> contact@hospital.com</p>
        </div>

        <div class="footer-section social">
            <h3>Follow Us</h3>
            <a href="#" title="Facebook"><i class="fab fa-facebook"></i></a>
            <a href="#" title="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="#" title="LinkedIn"><i class="fab fa-linkedin"></i></a>
        </div>
    </div>

    <div class="footer-bottom">
        <p>&copy; 2025 Hospital Name. All Rights Reserved.</p>
    </div>
</footer>
