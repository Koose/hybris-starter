<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<spring:htmlEscape defaultHtmlEscape="true" />

<c:set value="${fn:length(reviews) eq reviewsTotal}" var="showingAllReviews"/>
<div id="showingAllReviews" data-showingAllReviews="${showingAllReviews}" ></div>

<c:if test="${not empty reviews}">
	<c:forEach items="${reviews}" var="review" varStatus="status">
		<li class="review-entry">
			<div class="title">${fn:escapeXml(review.headline)}</div>
			<div class="rating">
				<div class="rating-stars float-left js-ratingCalc " data-rating='{"rating":"${review.rating}","total":5}' >
					<div class="greyStars">
                        <c:forEach  begin="1" end="5">
                            <span class="icon-star"></span>
                        </c:forEach>
					</div>
					<div class="greenStars js-greenStars">
                        <c:forEach  begin="1" end="5">
                            <span class="icon-star"></span>
                        </c:forEach>
					</div>
				</div>
			</div>
			<div class="content">${fn:escapeXml(review.comment)}</div>
			<div class="autor">
				<c:choose>
					<c:when test="${not empty review.alias}">
							${fn:escapeXml(review.alias)}
						</c:when>
					<c:otherwise>
						<spring:theme code="review.submitted.anonymous" />
					</c:otherwise>
				</c:choose>
				<c:set var="reviewDate" value="${review.date}" />
				<span class="date"> (<fmt:formatDate value="${reviewDate}" pattern="dd/MM/yyyy" />)</span>
			</div>

		</li>
	</c:forEach>
</c:if>
