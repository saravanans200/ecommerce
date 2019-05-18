package com.ecomm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecomm.dao.CategoryDAO;
import com.ecomm.dao.ProductDAO;
import com.ecomm.dao.SupplierDAO;
import com.ecomm.model.Category;
import com.ecomm.model.Product;
import com.ecomm.model.Supplier;

@Controller
public class ProductController {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;

	@RequestMapping(value="/ProductDisplay")
	public String dispProduct(Model m) {
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);

		return "ProductDisplay";
	}
	
	@RequestMapping(value="/ProductDesc/{productId}")
	public String productDesc(@PathVariable("productId") int proid,Model m) {
		Product product=productDAO.getProduct(proid);
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		m.addAttribute("product",product);
	    return "ProductDesc";
	}
	
    @RequestMapping(value="/Product")
	public String displayProduct(Model m) {
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		List<Category> listCategories=categoryDAO.getCategories();
		m.addAttribute("listCategories",listCategories);
		List<Supplier> listSuppliers = supplierDAO.getSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);

		for (Product product : listProducts) {
			System.out.println(product.getProductName() + ",");
		}
		return "Product";
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@RequestParam("proname") String proname, @RequestParam("prodesc") String prodesc,
			@RequestParam("proprice") double proprice,@RequestParam("prostock") int prostock,
			@RequestParam("categoryId") int catid,@RequestParam("supplierId") int supid,@RequestParam("pimage") MultipartFile pimage,Model m) {
		Product product=new Product();
		product.setProductName(proname);
		product.setProductDesc(prodesc);
		product.setPrice(proprice);
		product.setStock(prostock);
		product.setCategoryId(catid);
		product.setSupplierId(supid);
		productDAO.addProduct(product);
		 
        String path="F:/FINAL_WORKSPACE/frontend/src/main/webapp/resources/images/";
		path=path+String.valueOf(product.getProductId())+".jpg";
	    
		File image=new File(path);
		if(!pimage.isEmpty())
		{

			try {
				byte[] buffer=pimage.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();

			}
			
			catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		
        List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		List<Category> listCategories=categoryDAO.getCategories();
		m.addAttribute("listCategories",listCategories);
		List<Supplier> listSuppliers = supplierDAO.getSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);

		return "Product";
	}

	@RequestMapping(value="/deleteProduct/{productId}")
	public String deleteProduct(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		String path="F:/FINAL_WORKSPACE/frontend/src/main/webapp/resources/images/";
		path=path+String.valueOf(product.getProductId())+".jpg";
	    File image=new File(path);
		image.delete();
		
		productDAO.deleteProduct(product);
		
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		List<Category> listCategories=categoryDAO.getCategories();
		m.addAttribute("listCategories",listCategories);
		List<Supplier> listSuppliers = supplierDAO.getSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "Product";
	}

	@RequestMapping(value="/updateProduct/{productId}")
	public String updateCategory(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		m.addAttribute("product",product);
		
		Category category=categoryDAO.getCategory(product.getCategoryId());
		List<Category> listCategories=categoryDAO.getCategories();
		m.addAttribute("listCategories",listCategories);
		m.addAttribute("cat",category);
	
		Supplier supplier=supplierDAO.getSupplier(product.getSupplierId());
		List<Supplier> listSuppliers = supplierDAO.getSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		m.addAttribute("sup",supplier);
	
		
		return "updateProduct";
	}
	
	@RequestMapping(value="/updateProductDB/{productId}",method=RequestMethod.POST)
	public String updateProductDatabase(@PathVariable("productId") int proid,@RequestParam("proname") String proname,
			@RequestParam("prodesc") String prodesc,@RequestParam("proprice") double proprice,@RequestParam("prostock") int prostock,
			@RequestParam("categoryId") int catid,@RequestParam("supplierId") int supid,@RequestParam("pimage") MultipartFile pimage,Model m)
	{
		Product product=productDAO.getProduct(proid);
		product.setProductName(proname);
		product.setProductDesc(prodesc);
		product.setPrice(proprice);
		product.setStock(prostock);
		product.setCategoryId(catid);
		product.setSupplierId(supid);
		
		if(!pimage.isEmpty())
		{
			String path="F:/FINAL_WORKSPACE/frontend/src/main/webapp/resources/images/";
			path=path+String.valueOf(product.getProductId())+".jpg";
		    File oldimage=new File(path);
			oldimage.delete();

			File image=new File(path);
			try {
				byte[] buffer=pimage.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();

			}
			
			catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		
		productDAO.updateProduct(product);
		
		Category category=categoryDAO.getCategory(catid);
		Supplier supplier=supplierDAO.getSupplier(supid);
		
		List<Product> listProducts = productDAO.getProducts();
		m.addAttribute("listProducts", listProducts);
		List<Category> listCategories=categoryDAO.getCategories();
		m.addAttribute("listCategories",listCategories);
		List<Supplier> listSuppliers = supplierDAO.getSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
	
		
		return "Product";
	}
}
