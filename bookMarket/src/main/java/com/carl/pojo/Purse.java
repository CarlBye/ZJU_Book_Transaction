package com.carl.pojo;

public class Purse {
    private Integer id;

    private Integer userId;

    private Float balance;

    private String recharge;

    private String withdrawals;

    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Float getBalance() {
        return balance;
    }

    public void setBalance(Float balance) {
        this.balance = balance;
    }

    public String getRecharge() {
        return recharge;
    }

    public void setRecharge(String recharge) {
        this.recharge = recharge == null ? null : recharge.trim();
    }

    public String getWithdrawals() {
        return withdrawals;
    }

    public void setWithdrawals(String withdrawals) {
        this.withdrawals = withdrawals == null ? null : withdrawals.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}