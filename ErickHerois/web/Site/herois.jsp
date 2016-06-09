<%@page import="modelo.Regiao"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.RegiaoDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%
    HeroiDAO dao = new HeroiDAO();
    List<Heroi> lista;

    CategoriaDAO cdao = new CategoriaDAO();
    EditoraDAO edao = new EditoraDAO();
    RegiaoDAO rdao = new RegiaoDAO();

    List<Editora> e = edao.listar();
    List<Regiao> r = rdao.listar();
    List<Categoria> c = cdao.listar();

    if (request.getParameter("categoria") != null) {
        lista = dao.filtrarCategoria(Integer.parseInt(request.getParameter("categoria")));
    } else if (request.getParameter("editora") != null) {
        lista = dao.filtrarEditora(Integer.parseInt(request.getParameter("editora")));

    } else if (request.getParameter("regiao") != null) {
        lista = dao.filtrarRegiao(Integer.parseInt(request.getParameter("regiao")));
    } else if (request.getParameter("filtro") != null) {
        lista = dao.filtrar(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }
%>

<%@include file="header.jsp"%>
<div class="text">
    <h2>Herois</h2>
    <div class="dropdown">
        <p>Filtros</p>
        <div class="dropdown-content">
            Categorias:<br/>
            <%for (Categoria citem : c) {%>
            <a href="herois.jsp?categoria=<%out.print(citem.getCodigo());%>" class="list-group-item"><%out.print(citem.getNome());%></a><br/>
            <%}%>
            Editora:<br/>
            <%for (Editora eitem : e) {%>
            <a href="herois.jsp?editora=<%=eitem.getCodigo()%>" class="list-group-item"><%=eitem.getNome()%></a><br/>
            <%}%>
            Regi�es:<br/>
            <%for (Regiao ritem : r) {%>
            <a href="herois.jsp?regiao=<%=ritem.getCodigo()%>" class="list-group-item"><%=ritem.getNome()%></a><br/>
            <%}%>
        </div>
        </br>
    </div>
    <div class="cards">
        <%
            for (Heroi item : lista) {
        %>
        <h3><%=item.getNome()%></h3>
        <div class="foto">
            <img src ="../images/<%=item.getFoto()%>">
        </div>
        <table>
            <tr>
                <td>Nome</td>
                <td>Codinome</td>
                <td>Descri�ao</td>
            </tr>
            <tr>
                <td><%=item.getNome()%></td>
                <td><%=item.getCodinome()%></td>
                <td><%=item.getDescricao()%></td>
            </tr>
        </table>
        <ul>
            <li>For�a</li>
            <li><%=item.getForca()%></li>
            <li>Intelig�ncia</li>
            <li><%=item.getInteligencia()%></li>
            <li>Velocidade</li>
            <li><%=item.getVelocidade()%></li>
            <li>Proje��o de Energia</li>
            <li><%=item.getProjecaoenergia()%></li>
            <li>Resist�ncia</li>
            <li><%=item.getResistencia()%></li>
            <li>Habilidade de Combate</li>
            <li><%=item.getHabilidadecombate()%></li>
        </ul>
        <table>
            <tr>
                <td>Categoria</td>
                <td>Editora</td>
                <td>Regi�o</td>
            </tr>
            <tr>
                <%if (item.getCategoria() != null) {%> 
                <td><%=item.getCategoria().getNome()%> </td>
                <% } else {%>
                <%}%>
                <%if (item.getEditora() != null) {%> 
                <td><%=item.getEditora().getNome()%> </td>
                <% } else {%>
                <%}%>
                <%if (item.getRegiao() != null) {%> 
                <td><%=item.getRegiao().getNome()%> </td>
                <% } else {%>
                <%}%>
            </tr>
        </table>
        <br/>
        <%}%>
    </div>
    <br/>
</div>
</body>
</html>