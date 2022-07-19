<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../common/head.jspf"%>

<section class="mt-5">
  <div class="container mx-auto px-3">
    <form class="table-box-type-1" method="POST" action="../article/doWrite">
      <table>
        <colgroup>
          <col width="200" />
        </colgroup>
        <tbody>
          <tr>
            <th>작성자</th>
            <td>${rq.loginedMember.nickname}</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>
              <input name="title" type="text" placeholder="제목" class="w-96 input input-bordered w-full max-w-xs"/>
            </td>
          </tr>
          <tr>
            <th>내용</th>
            <td>
              <textarea class="w-full textarea textarea-bordered" name="body" rows="10" placeholder="내용"></textarea>
            </td>
          </tr>
          <tr>
            <th>작성</th>
            <td>
              <input type="submit" class="btn btn-primary" value="작성" />
              <button type="button" class="btn btn-outline btn-success" onclick="history.back();">뒤로가기</button>
            </td>
          </tr>
        </tbody>
      </table>
      </from>
  </div>
</section>

<%@ include file="../common/foot.jspf"%>