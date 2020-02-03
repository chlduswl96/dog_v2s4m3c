package dev.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.purchase.PurchaseProc")
public class PurchaseProc implements PurchaseProcInter{
	
	@Autowired
	PurchaseDAOInter purchaseDAOInter;
}
