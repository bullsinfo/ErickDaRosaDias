<%@include file="../cabecalho.jsp"%>
<div class="text">
    <h2>Regiao</h2>

    <div>
        <form action="add-ok.jsp" method="post">
            <label>Nome:</label></br>
            <input type="text" placeholder="Insira o nome da regi�o" name="nome" required></br>
            <label>Descri��o:</label></br>
            <input type="text" placeholder="Insira a descri��o da regi�o" name="descricao" ></br></br>
            <input type="submit" value="Enviar"></br>
            <input type="reset" value="Limpar">

        </form>



    </div>

    </br>

    <div id="botao"><a href="index.jsp">Voltar</a></div>
</div>
</body>
</html>
