const Transaction = () => {
    return (
        <div className="animal">
            <h2>Cadastro de Animal</h2>
                <form className="form-container" action="processar_animal.php" method="POST">
                <label htmlFor="animal_produtor" className="label">Endereço do Produtor:</label>
                <input type="text" id="animal_produtor" name="animal_produtor" className="input"/><br/><br/>
    
                <label htmlFor="animal_codigo" className="label">Código:</label>
                <input type="text" id="animal_codigo" name="animal_codigo" className="input"/><br/><br/>
    
                <label htmlFor="animal_peso_nascimento" className="label">Peso ao Nascer:</label>
                <input type="text" id="animal_peso_nascimento" name="animal_peso_nascimento" className="input"/><br/><br/>
    
                <label htmlFor="animal_data_nascimento" className="label">Data de Nascimento:</label>
                <input type="text" id="animal_data_nascimento" name="animal_data_nascimento" className="input"/><br/><br/>
    
                <label htmlFor="animal_data_desmame" className="label">Data de Desmame:</label>
                <input type="text" id="animal_data_desmame" name="animal_data_desmame" className="input"/><br/><br/>
    
                <label htmlFor="animal_peso_desmame" className="label">Peso ao Desmame:</label>
                <input type="text" id="animal_peso_desmame" name="animal_peso_desmame" className="input"/><br/><br/>
    
                <label htmlFor="animal_categoria" className="label">Categoria:</label>
                <input type="text" id="animal_categoria" name="animal_categoria" className="input"/><br/><br/>
    
                <label htmlFor="animal_raca" className="label">Raça:</label>
                <input type="text" id="animal_raca" name="animal_raca" className="input"/><br/><br/>
    
                <label htmlFor="animal_sexo" className="label">Sexo:</label>
                <input type="text" id="animal_sexo" name="animal_sexo" className="input"/><br/><br/>
    
                <label htmlFor="animal_status" className="label">Status:</label>
                <input type="text" id="animal_status" name="animal_status" className="input"/><br/><br/>
    
                <input type="submit" value="Registrar" className="submit-button"/>
            </form>
        </div>
    );
}

export default Transaction;
