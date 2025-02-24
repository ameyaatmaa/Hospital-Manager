<style>
/* Footer Styling */
footer {
    background: linear-gradient(135deg, #0077b6, #48cae4); /* Matching Navbar Colors */
    color: white;
    text-align: center;
    padding: 30px 0;
    font-size: 15px;
    position: relative;
    overflow: hidden;
    border-top: 4px solid #006494; /* Subtle separation line */
    transition: all 0.3s ease-in-out;
}

/* Footer container */
.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    max-width: 1100px;
    margin: auto;
    padding: 15px 20px;
}

/* Footer sections */
.footer-section {
    flex: 1;
    min-width: 250px;
    margin: 10px;
    text-align: center;
}

.footer-section h3 {
    font-size: 18px;
    margin-bottom: 8px;
    color: #e0f7ff; /* Light pastel text */
}

/* Contact Details */
.footer-section p {
    margin: 4px 0;
    opacity: 0.9;
}

/* Social Icons */
.footer-section .social {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

.footer-section .social a {
    color: white;
    font-size: 42px;  /* Increased Icon Size */
    margin: 0 20px;    /* More Spacing Between Icons */
    transition: transform 0.3s ease, color 0.3s ease;
}

.footer-section .social a:hover {
    color: #e0f7ff;
    transform: scale(1.3);
}

/* Footer Bottom */
.footer-bottom {
    background: #006494;
    padding: 12px 0;
    font-size: 14px;
    margin-top: 20px;
    text-align: center;
    color: #e0f7ff;
    border-top: 2px solid #e0f7ff;
    transition: all 0.3s ease-in-out;
}

/* Hover Effect */
footer:hover {
    background: linear-gradient(135deg, #006494, #3bb3d3);
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .footer-container {
        flex-direction: column;
        align-items: center;
        text-align: center;
    }
    .footer-section {
        margin-bottom: 15px;
    }
}
</style>

<footer>
    <div class="footer-container">
        <div class="footer-section about">
            <p>Delivering world-class medical services with expert doctors and advanced facilities.</p>
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
        <p>&copy; 2025 ameyaatmaa. All Rights Reserved.</p>
    </div>
</footer>
