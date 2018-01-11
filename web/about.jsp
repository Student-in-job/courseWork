<%-- 
    Document   : about
    Created on : 07.10.2017, 12:37:26
    Author     : ksinn
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String [] menu = {"", "", "active", "", ""}; %>
<%@include file="/header.jsp" %>
<!-- Main component for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>Choose coursework</h1>
    <p>The system will allow you to fix the theme of coursework.</p>
</div>
<div class="well well-sm">
    <h1>
        Как использовать 
        <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#use" aria-expanded="false" aria-controls="collapseExample">
            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
        </button>
    </h1>
    <div class="collapse" id="use">
        <div class="well">
            <ol>
                <li>
                    <p>Получить пароль у своего учителя</p>
                    <p><img src="img/0.png" class="img-thumbnail"></p>
                </li>
                <li>
                    <p>Ввести пароль в поле на главной странице и нажать кнопку</p>
                    <p><img src="img/1.png" class="img-thumbnail"></p>
                </li>
                <li>
                    <p>В появившемся списке выбрать понравившуюся тему и нажать кнопку</p>
                    <p>(помните, что тему можно выбрать только <mark>один раз</mark>, изменить выбор вы не сможете)</p>
                    <p><img src="img/2.png" class="img-thumbnail"></p>
                </li>
                <li>
                    <p><mark>Убедиться</mark> в успехе</p>
                    <p><img src="img/3.png" class="img-thumbnail"></p>
                </li>
            </ol>
        </div>
    </div>
</div>
<div class="well well-sm">
    <h1>
        Возможные проблемы 
        <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#trowbl" aria-expanded="false" aria-controls="collapseExample">
            <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
        </button>
    </h1>
    <div class="collapse" id="trowbl">
        <div class="well">
            <ul>
                <li>
                    <h3>Введен неправельный пароль</h3>
                    <p><img src="img/4.png" class="img-thumbnail"></p>
                    <h5>Возможные причины:</h5>
                    <ul>
                        <li>
                            <h6>Вы ошиблись при вводе пароля</h6>
                            <p><strong>Решение:</strong> Введите пароль без ошибок</p>
                        </li>
                    </ul>
                </li>
                <li>
                    <h3>У вас уже есть тема</h3>
                    <p><img src="img/5.png" class="img-thumbnail"></p>
                    <h5>Это не проблема;)</h5>                    
                </li>
                <li>
                    <h3>Ошибка сохранения данных</h3>
                    <p><img src="img/6.png" class="img-thumbnail"></p>
                    <h5>Возможные причины:</h5>
                    <ul>
                        <li>
                            <h6>Пока вы думали, кто то уже занял выбранную тему</h6>
                            <p><strong>Решение:</strong> Вернитесь назад, обновите страницу и выберете другую тему</p>
                        </li>
                        <li>
                            <h6>Ошибка на сервере</h6>
                            <p><strong>Решение:</strong> Сообщите администратору</p>
                        </li>
                    </ul>
                </li>
                <li>
                    <h3>Любая другая ошибка</h3>
                    <p><img src="img/6.png" class="img-thumbnail"></p>
                    <h5>Целая куча;):</h5>
                    <ul>
                        <li>
                            <h6>Все что угодно могло пойти не так))))</h6>
                            <p><strong>Решение:</strong> С фотографируйте экран и сообщите администратору</p>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>