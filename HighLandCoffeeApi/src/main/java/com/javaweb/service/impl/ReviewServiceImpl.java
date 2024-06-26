package com.javaweb.service.impl;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import com.javaweb.reponsitory.OrderDetailRepo;
import com.javaweb.request.AllAvgStarReview;
import com.javaweb.request.AvgReviewRequest;
import com.javaweb.request.ReviewProductRequest;
import org.springframework.stereotype.Service;

import com.javaweb.entity.Customer;
import com.javaweb.entity.OrderDetail;
import com.javaweb.entity.Orders;
import com.javaweb.entity.Review;
import com.javaweb.entity.User;
import com.javaweb.exception.ProductException;
import com.javaweb.exception.UserException;
import com.javaweb.reponsitory.ReviewRepo;
import com.javaweb.request.ReviewRequest;
import com.javaweb.service.CustomerService;
import com.javaweb.service.OrderDetailService;
import com.javaweb.service.OrderService;
import com.javaweb.service.ReviewService;
import com.javaweb.service.UserService;

@Service
public class ReviewServiceImpl implements ReviewService {

    private OrderDetailService orderDetailService;
    private ReviewRepo reviewRepo;
    private OrderService orderService;
    private UserService userService;
    private CustomerService customerService;
    private OrderDetailRepo orderDetailRepo;


    public ReviewServiceImpl(OrderDetailService orderDetailService, ReviewRepo reviewRepo, OrderService orderService, UserService userService, CustomerService customerService, OrderDetailRepo orderDetailRepo) {
        this.orderDetailService = orderDetailService;
        this.reviewRepo = reviewRepo;
        this.orderService = orderService;
        this.userService = userService;
        this.customerService = customerService;
        this.orderDetailRepo = orderDetailRepo;
    }

    @Override
    @Transactional
    public Review createReview(ReviewRequest rq, Long customer_id) throws ProductException, UserException {
        OrderDetail od = new OrderDetail();
        List<OrderDetail> listOd = new ArrayList<>();
        Review rv = new Review();
        Review savedReview = new Review();
        float point = 0;
        int price = 0;
        if (rq.getOrder_id() != null && !rq.getProduct_id().equals("")) {
            od = orderDetailService.findFirstByProductProductIdOrderByOrderDetailIdAsc(rq.getProduct_id());
            listOd = orderDetailService.findOrderDetailByOrderIdAndProductId(rq.getOrder_id(), rq.getProduct_id());
        }
        if (od != null && listOd != null) {
           Orders order = orderService.findOrderByOrderId(od.getOrder_id());
            Customer customer = customerService.findCustomerById(customer_id);
            User user = userService.findUserById(customer.getUser_id());
            for(OrderDetail item : listOd){
                System.err.println("pir = " + item.getPrice());
                price = price + item.getPrice();
                item.setReview_status("Active");
                orderDetailRepo.save(item);
            }
            point = (float) (price*0.08);
            System.out.print("price " + price + "    " + "point" + point);
            user.setPoints( (int)point + user.getPoints());
            rv.setPoint_review((int)point );
            if (!rq.getContent().equals("")) {
                rv.setContent(rq.getContent());
            }
            if (rq.getStar() != 0) {
                rv.setStar(rq.getStar());
            }
            rv.setOrder_detail_id(od.getOrder_detail_id());
            rv.setCreated_at(LocalDateTime.now());
            rv.setCreated_by(customer_id);
            rv.setProduct_id(rq.getProduct_id());
            rv.setStatus("Active");
            rv.setUpdated_at(LocalDateTime.now());
        }
        savedReview = reviewRepo.save(rv);
        return savedReview;
    }

    @Override
    public List<ReviewProductRequest> findReviewByProductIdAndCustomer(String productId) {
        List<Object[]> results = reviewRepo.findReviewByProductIdAndCustomer(productId);
        return results.stream()
                .map(this::mapToReviewProductRequest)
                .collect(Collectors.toList());
    }

    @Override
    public List<AvgReviewRequest> findAverageStarAndCountByProductId(String productId) {
        List<Object[]> results = reviewRepo.findAverageStarAndCountByProductId(productId);
        return results.stream()
                .map(this::mapToAvgReviewRequest)
                .collect(Collectors.toList());
    }

    private ReviewProductRequest mapToReviewProductRequest(Object[] result) {
        String product_id = (String) result[0];
        BigDecimal star = (BigDecimal) result[1];
        String content = (String)result[2];
        String customer_name = (String) result[3];
        Timestamp date = (Timestamp ) result[4];
        return new ReviewProductRequest(product_id,star,content,customer_name,date);
    }

    private  AvgReviewRequest mapToAvgReviewRequest(Object[] result){
        BigDecimal star = (BigDecimal) result[0];
        BigInteger count = (BigInteger) result[1];
        return new AvgReviewRequest(star,count);
    }

    private AllAvgStarReview maptOAllAvgStarReview(Object[] result){
        String product_id = (String) result[0];
        BigDecimal star = (BigDecimal) result[1];
        return new AllAvgStarReview(product_id, star);
    }

    @Override
    public List<AllAvgStarReview> findAverageStar() {
        List<Object[]> results = reviewRepo.findAverageStar();
        return results.stream()
                .map(this::maptOAllAvgStarReview)
                .collect(Collectors.toList());
    }


}
