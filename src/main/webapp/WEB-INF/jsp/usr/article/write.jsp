<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시물 작성" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../../common/toastUiEditorLib.jspf"%>

<script>
	let ArticleWrite__submitDone = false;
	function ArticleWrite__submit(form) {
		if (ArticleWrite__submitDone) {
			alert('처리중입니다.');
			return;
		}
		
		form.boardId.value = form.boardId.value.trim();
		if (form.boardId.value == 0) {
			alert('게시판 번호를 선택해주세요.');
			form.boardId.focus();
			return;
		}
		
		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return;
		}

		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();

		if (markdown.length == 0) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return;
		}

		form.body.value = markdown;

		form.submit();
		ArticleWrite__submitDone = true;
	}
</script>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<form onsubmit="ArticleWrite__submit(this); return false;"
			class="table-box-type-1" method="POST" action="../article/doWrite">
			<input type="hidden" name="body" />
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
					<tr>
						<th>게시판</th>
						<td><select class="select select-bordered" name=boardId>
								<option selected disabled>게시판을 선택해주세요.</option>
								<option value="1">공지</option>
								<option value="2">자유</option>
						</select> <!-- 
              <label>
                공지
                <input type="radio" name="boardId" value="1" />
              </label>
              <label>
                자유
                <input type="radio" name="boardId" value="2" />
              </label>
              --></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input required="required" name="title" type="text"
							placeholder="제목"
							class="w-96 input input-bordered w-full max-w-xs" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template"></script>
							</div>
						</td>
					</tr>
					<tr>
						<th>작성</th>
						<td><input type="submit" class="btn btn-primary" value="작성" />
							<button type="button" class="btn btn-outline btn-success"
								onclick="history.back();">뒤로가기</button></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>