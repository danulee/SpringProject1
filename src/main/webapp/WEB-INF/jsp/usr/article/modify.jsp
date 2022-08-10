<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="게시물 수정" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../../common/toastUiEditorLib.jspf"%>

<script>
	let ArticleModify__submitDone = false;
	function ArticleModify__submit(form) {
		if (ArticleModify__submitDone) {
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
		ArticleModify__submitDone = true;
		form.submit();
	}
</script>

<section class="mt-5">
	<div class="container mx-auto px-3">
		<form class="table-box-type-1" method="POST"
			action="../article/doModify"
			onsubmit="ArticleModify__submit(this); return false;">
			<input type="hidden" name="id" value="${article.id}" />
			<input type="hidden" name="replaceUri" value="${param.replaceUri}" />
			<table>
				<colgroup>
					<col width="200" />
				</colgroup>
				<tbody>
					<tr>
						<th>번호</th>
						<td>
							<div class="badge badge-primary">${article.id}</div>
						</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.forPrintType2RegDate}</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.forPrintType2UpdateDate}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.extra__writerName}</td>
					</tr>
					<tr>
						<th>조회</th>
						<td><span class="text-blue-700">${article.hitCount}</span></td>
					</tr>
					<tr>
						<th>추천</th>
						<td><span class="text-blue-700">${article.goodReactionPoint}</span>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input name="title" type="text" placeholder="제목"
							class="w-96 input input-bordered w-full max-w-xs"
							value="${article.title}" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div class="toast-ui-editor">
								<script type="text/x-template">${article.body}</script>
							</div>
						</td>
					</tr>
					<tr>
						<th>수정</th>
						<td><input type="submit" class="btn btn-primary" value="수정" />
							<a class="btn btn-outline btn-success" href="${param.replaceUri}">뒤로가기</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>