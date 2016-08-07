
/**
 * @author LUAN LUCAS
 *
 */
package br.com.project.checkskills.entities.autenticacao;

import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.project.checkskills.entities.compositekeys.UsuarioPermissaoKey;
import br.com.project.checkskills.utils.BaseEntity;

@Entity
@Table(name= "ASS_USUARIO_PERMISSAO")
public class UsuarioPermissaoEntity extends  BaseEntity<UsuarioPermissaoKey>{

	private static final long serialVersionUID = 1L;

	
	
}