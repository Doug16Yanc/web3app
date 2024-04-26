
const Services = () => {
    return (
        <div className="produtor">
            <h2>Cadastro de Produtor</h2>
            <form className="form-container" action="processar_produtor.php" method="POST">
                <label htmlFor="produtor_id">ID do Produtor:</label>
                <input type="text" id="produtor_id" name="produtor_id"/><br/><br/>
    
                <label htmlFor="produtor_nome">Nome:</label>
                <input type="text" id="produtor_nome" name="produtor_nome"/><br/><br/>
    
                <label htmlFor="produtor_email">E-mail:</label>
                <input type="email" id="produtor_email" name="produtor_email"/><br/><br/>
    
                <label htmlFor="produtor_telefone">Telefone:</label>
                <input type="text" id="produtor_telefone" name="produtor_telefone"/><br/><br/>
    
                <label htmlFor="produtor_localizacao">Localização:</label>
                <input type="text" id="produtor_localizacao" name="produtor_localizacao"/><br/><br/>
    
                <input type="submit" value="Registrar"/>
            </form>
        </div>
    );
}

export default Services;
