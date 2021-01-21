<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<body>

<c:if test="${msg==2}">
	<script type="text/javascript">
		alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.")
	</script>
</c:if>
<c:if test="${msg==1}">
	<script type="text/javascript">
		alert("������ �Ϸ�Ǿ����ϴ�.")
	</script>
</c:if>


<h2>��ü�ۺ���</h2>
<table width="700" border="1" bordercolor="skyblue">
	<tr height="40" align="right">
		<td colspan="5" align="right">
		<button onclick="location.href='BoardWriteForm.jsp'">�۾���</button>
		</td>
	</tr>
	<tr height="40">
		<td width="50" align="center">��ȣ</td>
		<td width="320" align="center">����</td>
		<td width="100" align="center">�ۼ���</td>
		<td width="150" align="center">�ۼ���</td>
		<td width="80" align="center">��ȸ��</td>
	</tr>
	
	<c:set var="number" value="${number }"/>	<!-- request��ü�� �Ѿ�� number�� "number"��� �̸� �ٿ��� �޴´� -->
	<c:forEach var="bean" items="${v}" >	<!-- v�� EL�� �޾Ƽ� bean�� �ϳ��� ���ٴ�-->
	
	<tr height="40">
		<td width="50" align="center">${number}</td>	<!-- �۹�ȣ -->
		<td width="320" align="center">
			<c:if test="${bean.re_step>1}">
				<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">	<!-- ����� ��� �鿩���⸦ ���ִ°� -->
				&nbsp;
				</c:forEach>
			</c:if>
			<a href="BoardInfoControl.do?num=${bean.num}">${bean.subject}</a>	<!-- ���� -->
		</td>
		<td width="100" align="center">${bean.writer}</td>	<!-- �ۼ��� -->
		<td width="150" align="center">${bean.reg_date}</td>	<!-- �ۼ��� -->
		<td width="80" align="center">${bean.readcount}</td>	<!-- ��ȸ�� -->
	</tr>
												<!-- EL�ȿ����� ������ �ȵǹǷ�  -->
	<c:set var="number" value="${number-1 }"/>	<!-- for�� �ѹ� ������ ����(�Խñ� �Ѱ��� ��µǸ�) number�� -1�� �ϸ鼭 �ٽ� �־���(������ �Խ����� 1�� ���������̴ϱ� -->
	</c:forEach>
</table>
<p>
<!-- jstl�� ������ ī���͸� �ҽ� �ۼ� -->

	<c:if test="${count>0 }">
		<c:set var="pageCount" value="${count/ pageSize+(count%pageSize == 0 ? 0 :1) }"/>
		<c:set var="startPage" value="${1 }"/>
		
		<c:if test="${currentPage % 10 != 0}">
			<!-- ����� ���������� ���Ϲ޾ƾ��ϱ⿡ fmt -->
			<fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true" />
			<c:set var="startPage" value="${result*10+1 }"/>
		</c:if>
		
		<c:if test="${currentPage % 10 == 0}">
			<!-- ����� ���������� ���Ϲ޾ƾ��ϱ⿡ fmt -->
			<c:set var="startPage" value="${(result-1)*10+1 }"/>
		</c:if>
		
		<!-- ȭ�鿡 ������ ����¡ ó�� ���ڸ� ǥ�� -->
		<c:set var="pageBlock" value="${10 }"/>
		<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount }"/>
		</c:if>
		
		<!-- ���� ��ũ�� �ɾ�� �ϴ��� �ľ�. 11���������ʹ� ���� ��ư�� �־���Ѵ�. -->
		<c:if test="${startPage > 10}">
			<a href='BoradListCon.do?pageNum=${startPage-10 }'>[����] </a>
		</c:if>
	
		<!-- ����¡ó�� -->
		<c:forEach var="i" begin="${ startPage}" end="${endPage}">
			<a href='BoradListCon.do?pageNum=${i }' style="text-decoration:none">[${i}] </a>
		</c:forEach>
		
		<!-- ���� ��ũ�� �ɾ�� �ϴ��� �ľ�. -->
		<c:if test="${endPage < pageCount}">
			<a href='BoradListCon.do?pageNum=${startPage+10 }'>[����] </a>
		</c:if>
	</c:if>

</body>
</html>