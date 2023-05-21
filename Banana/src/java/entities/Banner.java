/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author PC
 */
public class Banner {

    private int bannerId;
    private String title;
    private String subTitle;
    private String linkTo;

    public Banner() {

    }

    public Banner(int bannerId, String title, String subTitle, String linkTo) {
        this.bannerId = bannerId;
        this.title = title;
        this.subTitle = subTitle;
        this.linkTo = linkTo;
    }

    public Banner(String title, String subTitle, String linkTo) {
        this.title = title;
        this.subTitle = subTitle;
        this.linkTo = linkTo;
    }

    public int getBannerId() {
        return bannerId;
    }

    public void setBannerId(int bannerId) {
        this.bannerId = bannerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getLinkTo() {
        return linkTo;
    }

    public void setLinkTo(String linkTo) {
        this.linkTo = linkTo;
    }

}
