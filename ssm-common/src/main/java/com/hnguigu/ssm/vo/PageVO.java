package com.hnguigu.ssm.vo;

import java.util.List;

public class PageVO<T> {

    private Long pageNum;

    private Long pageSize;

    /**
     * 总记录数
     */
    private Long totalRecords;

    /**
     * 总页数
     */
    private Long totalPages;

    private List<T> data;

    public Long getPageNum() {
        return pageNum;
    }

    public void setPageNum(Long pageNum) {
        this.pageNum = pageNum;
    }

    public Long getPageSize() {
        return pageSize;
    }

    public void setPageSize(Long pageSize) {
        this.pageSize = pageSize;
    }

    public Long getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Long totalRecords) {
        this.totalRecords = totalRecords;
    }

    public Long getTotalPages() {
        return (this.totalRecords + this.getPageSize() - 1) / this.getPageSize();
    }

    public void setTotalPages(Long totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Long getFirstPage() {
        return 1L;
    }

    public Long getLastPage() {
        return this.getTotalPages();
    }

    public Long getPreviousPage() {
        Long previousPage = this.getPageNum() - 1;
        if (previousPage < 1) {
            return 1L;
        }
        return previousPage;
    }

    public Long getNextPage() {
        Long nextPage = this.getPageNum() + 1;
        if (nextPage > this.getTotalPages()) {
            return this.getTotalPages();
        }
        return nextPage;
    }
}
