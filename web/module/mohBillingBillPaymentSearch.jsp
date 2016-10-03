
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<openmrs:htmlInclude file="/scripts/calendar/calendar.js" />
<openmrs:htmlInclude file="/moduleResources/@MODULE_ID@/scripts/jquery-1.3.2.js" />
<%@ taglib prefix="billingtag" uri="/WEB-INF/view/module/@MODULE_ID@/taglibs/billingtag.tld" %>
<%@ include file="templates/mohBillingLocalHeader.jsp"%>
<%@ include file="templates/mohBillingBillHeader.jsp"%>

<b class="boxHeader">Search Bill Payment </b>
<div class="box" style="height: 60px;">
	<div style="float: left; height: inherit;">
		<form action="" method="get">
			<table>
				<tr>
					<td>Payment identifier</td>
					<td><input type="text" name="paymentId" /></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Search Payment" /></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>	
</div>

<!-- <br/> &nbsp; or<br/><br/> 

<b class="boxHeader">Search Refund by Bill  Payment </b>
<div class="box" style="height: 60px;">
	<div style="float: left; height: inherit;">
		<form action="" method="get">
			<table>
				<tr>
					<td>Refund identifier</td>
					<td><input type="text" name="refundId" /></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Search Refund" /></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>	
</div>  -->
<br/>
<c:if test="${!empty checkedRefundsByChief}">	
<b>Approved Refunds</b> : <b style="color: blue;">(${fn:length(checkedRefundsByChief)})</b>
<div class="box">
<table style="width: 70%">
 <tr>
 <th class="columnHeader">#</th>
 <th class="columnHeader">Refund Id</th>
 <th class="columnHeader">Payment Id</th>
 <th class="columnHeader">Cashier Names</th>
 <th class="columnHeader">Submitted On</th>
 <th class="columnHeader">Action</th>
 </tr>
 <c:forEach items="${checkedRefundsByChief}" var="submittedRef" varStatus="status">
 <tr>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${status.count}.</td>
  <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.refundId}</td>
  <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.billPayment.billPaymentId}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.creator.personName}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.createdDate}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}"><a href="refundItemList.form?refundId=${submittedRef.refundId}&billPayment=${submittedRef.billPayment.billPaymentId}&confirm=true">Confirm</a></td>
 </tr>
 </c:forEach>
</table>
</div>
</c:if>


<br/>
<c:if test="${!empty pendingRefunds}">	
<b>Submitted Refunds for approval</b> : <b style="color: red;">(${fn:length(pendingRefunds)})</b>
<div class="box">
<table style="width: 70%">
 <tr>
 <th class="columnHeader">#</th>
 <th class="columnHeader">Refund Id</th>
 <th class="columnHeader">Payment Id</th>
 <th class="columnHeader">Cashier Names</th>
 <th class="columnHeader">Submitted On</th>
 <th class="columnHeader">Action</th>
 </tr>
 <c:forEach items="${pendingRefunds}" var="submittedRef" varStatus="status">
 <tr>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${status.count}.</td>
  <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.refundId}</td>
  <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.billPayment.billPaymentId}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.creator.personName}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}">${submittedRef.createdDate}</td>
 <td class="rowValue ${(status.count%2!=0)?'even':''}"><a href="refundItemList.form?refundId=${submittedRef.refundId}&billPayment=${submittedRef.billPayment.billPaymentId}&edit=true">view</a></td>
 </tr>
 </c:forEach>
</table>
</div>
</c:if>
<br/>
<c:if test="${!empty(paidItems)}">

<c:set var="paidItems" value="${paidItems}" />
<c:set var="payment" value="${payment}" />
<c:set var="consommation" value="${consommation}"/>

	<c:import url="mohBillingPaidServiceBillList.jsp" />
</c:if>
<%@ include file="/WEB-INF/template/footer.jsp"%>