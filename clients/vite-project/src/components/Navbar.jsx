const Navbar = () => {
    const redirectToRegister = () => {
        window.location.href = 'Services.jsx'; }
    return (
        <header>
        <nav>
            <img src="images/icon.png" alt="Logo" width="105px" />
            <button onClick={redirectToRegister}>REGISTRAR</button>
        </nav>
        </header>
    );
}


export default Navbar;